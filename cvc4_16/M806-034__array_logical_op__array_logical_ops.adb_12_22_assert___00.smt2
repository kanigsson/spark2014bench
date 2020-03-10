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

(declare-sort my_boolean 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (my_boolean my_boolean) Bool)

(declare-const dummy1 my_boolean)

(declare-datatypes ((my_boolean__ref 0))
(((my_boolean__refqtmk (my_boolean__content my_boolean)))))
(define-fun my_boolean__ref_my_boolean__content__projection ((a my_boolean__ref)) my_boolean 
  (my_boolean__content a))

(declare-fun to_rep1 (my_boolean) Int)

(declare-fun of_rep1 (Int) my_boolean)

;; inversion_axiom
  (assert
  (forall ((x my_boolean))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x my_boolean)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int my_boolean))))))
(declare-fun slide ((Array Int my_boolean) Int Int) (Array Int my_boolean))

;; slide_eq
  (assert
  (forall ((a (Array Int my_boolean)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int my_boolean)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int my_boolean)) (a__first Int) (a__last Int)
  (b (Array Int my_boolean)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int my_boolean)) (b (Array Int my_boolean)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

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
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int my_boolean))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int my_boolean) (elts a))

(define-fun of_array ((a (Array Int my_boolean)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes ((bool_array__ref 0))
(((bool_array__refqtmk (bool_array__content us_t)))))
(define-fun bool_array__ref_bool_array__content__projection ((a bool_array__ref)) us_t 
  (bool_array__content a))

(declare-const x us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun to_bool ((x1 my_boolean)) Bool (distinct (to_rep1 x1) 0))

(define-fun of_bool ((x1 Bool)) my_boolean (of_rep1 (ite x1 1 0)))

(declare-fun xorb ((Array Int my_boolean) Int Int (Array Int my_boolean) Int
  Int) (Array Int my_boolean))

(declare-fun andb ((Array Int my_boolean) Int Int (Array Int my_boolean) Int
  Int) (Array Int my_boolean))

(declare-fun orb ((Array Int my_boolean) Int Int (Array Int my_boolean) Int
  Int) (Array Int my_boolean))

(declare-fun notb ((Array Int my_boolean) Int Int) (Array Int my_boolean))

;; op_def
  (assert
  (forall ((a (Array Int my_boolean)) (b (Array Int my_boolean)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (select (orb a a_first a_last b b_first b_last) i) (of_bool
                                                           (or (to_bool
                                                               (select a i)) 
                                                           (to_bool
                                                           (select b (+ (- i a_first) b_first))))))) :pattern ((select 
  (orb a a_first a_last b b_first b_last) i)) )))))

;; op_def
  (assert
  (forall ((a (Array Int my_boolean)) (b (Array Int my_boolean)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (select (andb a a_first a_last b b_first b_last) i) (of_bool
                                                            (and (to_bool
                                                                 (select a i)) 
                                                            (to_bool
                                                            (select b (+ (- i a_first) b_first))))))) :pattern ((select 
  (andb a a_first a_last b b_first b_last) i)) )))))

;; op_def
  (assert
  (forall ((a (Array Int my_boolean)) (b (Array Int my_boolean)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (select (xorb a a_first a_last b b_first b_last) i) (of_bool
                                                            (xor (to_bool
                                                                 (select a i)) 
                                                            (to_bool
                                                            (select b (+ (- i a_first) b_first))))))) :pattern ((select 
  (xorb a a_first a_last b b_first b_last) i)) )))))

;; notb_def
  (assert
  (forall ((a (Array Int my_boolean)))
  (forall ((a_first Int) (a_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (select (notb a a_first a_last) i) (of_bool
                                           (not (to_bool (select a i)))))) :pattern ((select 
  (notb a a_first a_last) i)) )))))

(define-fun dynamic_invariant ((temp___expr_235 us_t)
  (temp___is_init_231 Bool) (temp___skip_constant_232 Bool)
  (temp___do_toplevel_233 Bool)
  (temp___do_typ_inv_234 Bool)) Bool (=>
                                     (not (= temp___skip_constant_232 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_235)
                                     (last1 temp___expr_235))))

(declare-sort t1b 0)

(declare-fun t1bqtint (t1b) Int)

;; t1b'axiom
  (assert (forall ((i t1b)) (and (<= 1 (t1bqtint i)) (<= (t1bqtint i) 40))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 40)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (t1b t1b) Bool)

(declare-const dummy3 t1b)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content t1b)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) t1b (t1b__content
                                                                 a))

(declare-fun array_logical_ops__test_ok1__x__aggregate_def (Int Int Int
  Int) (Array Int my_boolean))

(declare-sort t3b 0)

(declare-fun t3bqtint (t3b) Int)

;; t3b'axiom
  (assert (forall ((i t3b)) (and (<= 1 (t3bqtint i)) (<= (t3bqtint i) 40))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 40)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (t3b t3b) Bool)

(declare-const dummy4 t3b)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content t3b)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) t3b (t3b__content
                                                                 a))

(declare-fun array_logical_ops__test_ok1__y__aggregate_def (Int Int
  Int) (Array Int my_boolean))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; x__def_axiom
  (assert
  (= x (of_array (array_logical_ops__test_ok1__x__aggregate_def 1 0 1 0) 1
       40)))

(define-fun dynamic_invariant2 ((temp___expr_228 Int)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (or (= temp___is_init_224 true)
                                     (<= 0 1)) (in_range2 temp___expr_228)))

;; def_axiom
  (assert
  (forall ((temp___157 Int) (temp___158 Int) (temp___159 Int)
  (temp___160 Int))
  (let ((temp___156 (array_logical_ops__test_ok1__x__aggregate_def temp___157
                    temp___158 temp___159 temp___160)))
  (=>
  (and
  (and (dynamic_invariant2 temp___157 true true true true)
  (dynamic_invariant2 temp___158 true true true true))
  (and (dynamic_invariant2 temp___159 true true true true)
  (dynamic_invariant2 temp___160 true true true true)))
  (forall ((temp___161 Int))
  (ite (and (<= 31 temp___161) (<= temp___161 40))
  (= (to_rep1 (select temp___156 temp___161)) temp___160)
  (ite (and (<= 21 temp___161) (<= temp___161 30))
  (= (to_rep1 (select temp___156 temp___161)) temp___159)
  (ite (and (<= 11 temp___161) (<= temp___161 20))
  (= (to_rep1 (select temp___156 temp___161)) temp___158)
  (=> (and (<= 1 temp___161) (<= temp___161 10))
  (= (to_rep1 (select temp___156 temp___161)) temp___157))))))))))

;; y__def_axiom
  (assert
  (= y (of_array (array_logical_ops__test_ok1__y__aggregate_def 0 1 0) 1 40)))

;; def_axiom
  (assert
  (forall ((temp___163 Int) (temp___164 Int) (temp___165 Int))
  (let ((temp___162 (array_logical_ops__test_ok1__y__aggregate_def temp___163
                    temp___164 temp___165)))
  (=>
  (and
  (and (dynamic_invariant2 temp___163 true true true true)
  (dynamic_invariant2 temp___164 true true true true)) (dynamic_invariant2
  temp___165 true true true true))
  (forall ((temp___166 Int))
  (ite (and (<= 31 temp___166) (<= temp___166 40))
  (= (to_rep1 (select temp___162 temp___166)) temp___165)
  (ite (and (<= 11 temp___166) (<= temp___166 30))
  (= (to_rep1 (select temp___162 temp___166)) temp___164)
  (=> (and (<= 1 temp___166) (<= temp___166 10))
  (= (to_rep1 (select temp___162 temp___166)) temp___163)))))))))

;; r1__def_axiom
  (assert
  (= r1 (of_array
        (andb (to_array x) (first1 x) (last1 x) (to_array y) (first1 y)
        (last1 y)) (first1 x) (last1 x))))

(assert
;; defqtvc
 ;; File "array_logical_ops.ads", line 12, characters 0-0
  (not
  (forall ((i Int))
  (=>
  (= (of_array (array_logical_ops__test_ok1__x__aggregate_def 1 0 1 0) 1 40) 
  x)
  (=> (dynamic_invariant x true false true true)
  (=>
  (= (of_array (array_logical_ops__test_ok1__y__aggregate_def 0 1 0) 1 40) 
  y)
  (=> (dynamic_invariant y true false true true)
  (=>
  (= (of_array
     (andb (to_array x) (first1 x) (last1 x) (to_array y) (first1 y)
     (last1 y)) (first1 x) (last1 x)) r1)
  (=> (dynamic_invariant r1 true false true true)
  (=> (= (first1 r1) 1)
  (=> (<= 1 i)
  (=> (<= i 20)
  (not (= (distinct (to_rep1 (select (to_array r1) i)) 0) true))))))))))))))
(check-sat)
(exit)
