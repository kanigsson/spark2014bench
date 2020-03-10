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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index))
  (and (<= 1 (indexqtint i)) (<= (indexqtint i) 1000000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 1000000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((text__ref 0))
(((text__refqtmk (text__content us_t)))))
(define-fun text__ref_text__content__projection ((a text__ref)) us_t 
  (text__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant2 ((temp___expr_167 us_t)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (not (= temp___skip_constant_164 true))
                                     (dynamic_property 1 1000000
                                     (first1 temp___expr_167)
                                     (last1 temp___expr_167))))

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a1 t4s__ref)) us_t (t4s__content
                                                                   a1))

(declare-datatypes ((t6s__ref 0))
(((t6s__refqtmk (t6s__content us_t)))))
(define-fun t6s__ref_t6s__content__projection ((a1 t6s__ref)) us_t (t6s__content
                                                                   a1))

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_t)))))
(define-fun t8b__ref_t8b__content__projection ((a1 t8b__ref)) us_t (t8b__content
                                                                   a1))

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_t)))))
(define-fun t11b__ref_t11b__content__projection ((a1 t11b__ref)) us_t 
  (t11b__content a1))

(define-fun dynamic_invariant3 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 1000000)) (in_range3
                                     temp___expr_160)))

(assert
;; defqtvc
 ;; File "lcp.ads", line 3, characters 0-0
  (not
  (forall ((l Int))
  (=> (dynamic_invariant2 a true false true true)
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (<= (first1 a) x)
  (=> (<= x (last1 a))
  (=> (<= (first1 a) y)
  (=> (<= y (last1 a))
  (=> (dynamic_invariant1 l false false true true)
  (forall ((l1 Int))
  (=> (= l1 0)
  (forall ((o Bool))
  (=>
  (exists ((o1 Bool))
  (and
  (let ((o2 (+ x l1)))
  (and (in_range1 o2)
  (ite (<= o2 (last1 a))
  (let ((o3 (+ y l1)))
  (and (in_range1 o3) (= o1 (ite (<= o3 (last1 a)) true false))))
  (= o1 false))))
  (ite (= o1 true)
  (let ((o2 (+ y l1)))
  (and (in_range1 o2)
  (and (and (<= (first1 a) o2) (<= o2 (last1 a)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array a) o2)) o3)
  (let ((o4 (+ x l1)))
  (and (in_range1 o4)
  (and (and (<= (first1 a) o4) (<= o4 (last1 a)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array a) o4)) o5)
  (= o (ite (= o5 o3) true false)))))))))))) (= o false))))
  (=> (= o true)
  (let ((o1 (+ x l1)))
  (=> (in_range1 o1)
  (let ((o2 (- o1 1)))
  (=> (in_range1 o2)
  (forall ((r6b Int))
  (=> (= r6b o2)
  (=> (dynamic_invariant r6b true false true true)
  (let ((o3 (+ y l1)))
  (=> (in_range1 o3)
  (let ((o4 (- o3 1)))
  (=> (in_range1 o4)
  (forall ((r9b Int))
  (=> (= r9b o4)
  (=> (dynamic_invariant r9b true false true true)
  (=>
  (=> (<= y r9b)
  (and (and (<= (first1 a) y) (<= y (last1 a)))
  (and (<= (first1 a) r9b) (<= r9b (last1 a)))))
  (=>
  (=> (<= x r6b)
  (and (and (<= (first1 a) x) (<= x (last1 a)))
  (and (<= (first1 a) r6b) (<= r6b (last1 a)))))
  (forall ((l2 Int) (r6b1 Int) (r9b1 Int))
  (=>
  (= (let ((temp___207 (of_array (to_array a) y r9b1)))
     (let ((temp___206 (of_array (to_array a) x r6b1)))
     (bool_eq (to_array temp___206) (first1 temp___206) (last1 temp___206)
     (to_array temp___207) (first1 temp___207) (last1 temp___207)))) true)
  (=>
  (and
  (and
  (and
  (and (dynamic_invariant r6b1 true true true true) (dynamic_invariant r9b1
  true true true true)) (dynamic_invariant1 l2 false true true true))
  (= (- (+ x l2) 1) r6b1)) (= (- (+ y l2) 1) r9b1))
  (forall ((temp___208 Int))
  (=> (= temp___208 l2)
  (let ((o5 (+ l2 1)))
  (=> (in_range1 o5)
  (forall ((l3 Int))
  (=> (= l3 o5)
  (forall ((o6 Bool))
  (=>
  (exists ((o7 Bool))
  (and
  (let ((o8 (+ x l3)))
  (and (in_range1 o8)
  (ite (<= o8 (last1 a))
  (let ((o9 (+ y l3)))
  (and (in_range1 o9) (= o7 (ite (<= o9 (last1 a)) true false))))
  (= o7 false))))
  (ite (= o7 true)
  (let ((o8 (+ y l3)))
  (and (in_range1 o8)
  (and (and (<= (first1 a) o8) (<= o8 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) o8)) o9)
  (let ((o10 (+ x l3)))
  (and (in_range1 o10)
  (and (and (<= (first1 a) o10) (<= o10 (last1 a)))
  (exists ((o11 Int))
  (and (= (to_rep (select (to_array a) o10)) o11)
  (= o6 (ite (= o11 o9) true false)))))))))))) (= o6 false))))
  (=> (= o6 true)
  (let ((o7 (+ x l3)))
  (=> (in_range1 o7)
  (let ((o8 (- o7 1)))
  (=> (in_range1 o8)
  (forall ((r6b2 Int))
  (=> (= r6b2 o8)
  (=> (dynamic_invariant r6b2 true false true true)
  (let ((o9 (+ y l3)))
  (=> (in_range1 o9)
  (let ((o10 (- o9 1)))
  (=> (in_range1 o10)
  (forall ((r9b2 Int))
  (=> (= r9b2 o10)
  (=> (dynamic_invariant r9b2 true false true true)
  (=>
  (=> (<= y r9b2)
  (and (and (<= (first1 a) y) (<= y (last1 a)))
  (and (<= (first1 a) r9b2) (<= r9b2 (last1 a)))))
  (=>
  (=> (<= x r6b2)
  (and (and (<= (first1 a) x) (<= x (last1 a)))
  (and (<= (first1 a) r6b2) (<= r6b2 (last1 a)))))
  (= (let ((temp___207 (of_array (to_array a) y r9b2)))
     (let ((temp___206 (of_array (to_array a) x r6b2)))
     (bool_eq (to_array temp___206) (first1 temp___206) (last1 temp___206)
     (to_array temp___207) (first1 temp___207) (last1 temp___207)))) true)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
