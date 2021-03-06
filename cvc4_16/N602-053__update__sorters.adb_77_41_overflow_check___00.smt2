(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const values__first integer)

(declare-const values__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-fun index_of_minimum (us_t) Int)

(declare-fun index_of_minimum__function_guard (Int us_t) Bool)

(define-fun dynamic_invariant1 ((temp___expr_160 us_t)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (not (= temp___skip_constant_157 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_160)
                                     (last1 temp___expr_160))))

;; index_of_minimum__post_axiom
  (assert
  (forall ((unsorted us_t))
  (! (=>
     (and (dynamic_invariant1 unsorted true true true true)
     (<= (first1 unsorted) (last1 unsorted)))
     (let ((result (index_of_minimum unsorted)))
     (=> (index_of_minimum__function_guard result unsorted)
     (and
     (and (and (<= (first1 unsorted) result) (<= result (last1 unsorted)))
     (forall ((j Int))
     (=> (and (<= (first1 unsorted) j) (<= j (last1 unsorted)))
     (<= (to_rep (select (to_array unsorted) result)) (to_rep
                                                      (select (to_array
                                                              unsorted) j))))))
     (dynamic_invariant result true false true true))))) :pattern ((index_of_minimum
                                                                   unsorted)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t16b__ref 0))
(((t16b__refqtmk (t16b__content integer)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) integer 
  (t16b__content a))

(declare-datatypes ((t18b__ref 0))
(((t18b__refqtmk (t18b__content us_t)))))
(define-fun t18b__ref_t18b__content__projection ((a t18b__ref)) us_t 
  (t18b__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "sorters.ads", line 7, characters 0-0
  (not
  (forall ((values (Array Int integer)) (smallest Int) (temp___199 Int)
  (o Int))
  (=> (dynamic_property 1 2147483647 (to_rep values__first)
  (to_rep values__last))
  (=> (<= 1 (length (to_rep values__first) (to_rep values__last)))
  (=> (<= (to_rep values__last) 2147483647)
  (=> (dynamic_invariant smallest false false true true)
  (=> (= (to_rep values__first) temp___199)
  (=> (= (to_rep values__last) o)
  (let ((o1 (- o 1)))
  (=> (in_range1 o1)
  (forall ((current Int))
  (=> (= current temp___199)
  (=>
  (= (and (ite (<= temp___199 current) true false) (ite (<= current o1) true
                                                   false)) true)
  (forall ((temp___201 Int))
  (=> (= (to_rep values__last) temp___201)
  (=>
  (=> (<= current temp___201)
  (and
  (and (<= (to_rep values__first) current)
  (<= current (to_rep values__last)))
  (and (<= (to_rep values__first) temp___201)
  (<= temp___201 (to_rep values__last)))))
  (let ((temp___202 (of_array values current temp___201)))
  (let ((o2 (of_array (to_array temp___202) (first1 temp___202)
            (last1 temp___202))))
  (let ((o3 (index_of_minimum o2)))
  (=>
  (and (index_of_minimum__function_guard o3 o2)
  (and (dynamic_invariant o3 true false true true)
  (and (and (<= (first1 o2) o3) (<= o3 (last1 o2)))
  (forall ((j Int))
  (=> (and (<= (first1 o2) j) (<= j (last1 o2)))
  (<= (to_rep (select (to_array o2) o3)) (to_rep (select (to_array o2) j))))))))
  (forall ((smallest1 Int))
  (=> (= smallest1 o3)
  (forall ((spark__branch Bool) (values1 (Array Int integer)))
  (=>
  (and (= spark__branch (ite (= smallest1 current) false true))
  (ite (= spark__branch true)
  (and (in_range2 current)
  (let ((o4 values__last))
  (let ((o5 values__first))
  (exists ((o6 (Array Int integer)))
  (and (= o6 values1)
  (forall ((temp___index_165 Int))
  (=>
  (and (<= (first1 (of_array o6 (to_rep o5) (to_rep o4))) temp___index_165)
  (<= temp___index_165 (last1 (of_array o6 (to_rep o5) (to_rep o4)))))
  (= (to_rep
     (select (to_array (of_array o6 (to_rep o5) (to_rep o4))) temp___index_165)) 
  (ite (= temp___index_165 smallest1) (to_rep (select values current))
  (ite (= temp___index_165 current) (to_rep (select values smallest1))
  (to_rep
  (select (to_array (of_array values (to_rep o5) (to_rep o4))) temp___index_165))))))))))))
  (= values1 values)))
  (=> (exists ((o4 Int)) (= (to_rep values__last) o4))
  (forall ((usf Int))
  (let ((o4 (- current 1)))
  (=> (in_range1 o4)
  (forall ((o5 Int))
  (=> (= (to_rep values__first) o5)
  (=>
  (= (and (ite (<= o5 usf) true false) (ite (<= usf o4) true false)) true)
  (in_range1 (+ usf 1))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
