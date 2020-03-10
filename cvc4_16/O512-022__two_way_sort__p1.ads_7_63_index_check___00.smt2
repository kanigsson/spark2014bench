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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index))
  (and (<= 0 (indexqtint i)) (<= (indexqtint i) 1000000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1000000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 1000000)) (in_range2
                                     temp___expr_159)))

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
(((us_tqtmk (elts (Array Int Bool))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int Bool) (elts a))

(define-fun of_array ((a (Array Int Bool)) (f Int)
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

(declare-datatypes ((arr__ref 0))
(((arr__refqtmk (arr__content us_t)))))
(define-fun arr__ref_arr__content__projection ((a arr__ref)) us_t (arr__content
                                                                  a))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_166 us_t)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (dynamic_property 0 1000000
                                     (first1 temp___expr_166)
                                     (last1 temp___expr_166))))

(assert
;; defqtvc
 ;; File "p1.ads", line 4, characters 0-0
  (not
  (forall ((a (Array Int Bool)) (i Int) (j Int) (a1 (Array Int Bool)) (o Int)
  (o1 Int) (usf Int) (o2 Int) (o3 Int) (usf1 Int) (o4 Int))
  (=> (dynamic_property 0 1000000 (to_rep a__first) (to_rep a__last))
  (=> (dynamic_invariant i false false true true)
  (=> (dynamic_invariant j false false true true)
  (=>
  (exists ((o5 Int))
  (and (= (to_rep a__first) o5)
  (exists ((o6 Int))
  (and (= (to_rep a__last) o6)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (< o6 o5) true false))
  (ite (= spark__branch true) (= a1 a)
  (exists ((o7 Int))
  (and (= (to_rep a__first) o7)
  (and (in_range2 o7)
  (exists ((i1 Int))
  (and (= i1 o7)
  (exists ((o8 Int))
  (and (= (to_rep a__last) o8)
  (and (in_range2 o8)
  (exists ((j1 Int))
  (and (= j1 o8)
  (ite (<= i1 j1)
  (and
  (exists ((o9 Bool))
  (and
  (exists ((o10 Bool))
  (and
  (exists ((o11 Int))
  (and (= (to_rep a__last) o11)
  (exists ((o12 Int))
  (and (= (to_rep a__first) o12)
  (ite (= (and (ite (<= o12 i1) true false) (ite (<= i1 o11) true false)) true)
  (exists ((o13 Int))
  (and (= (to_rep a__last) o13)
  (exists ((o14 Int))
  (and (= (to_rep a__first) o14)
  (= o10 (and (ite (<= o14 j1) true false) (ite (<= j1 o13) true false)))))))
  (= o10 false))))))
  (ite (= o10 true)
  (and (exists ((o11 Int)) (= (to_rep a__first) o11))
  (= o9 (ite (forall ((k Int))
             (=> (and (<= (to_rep a__first) k) (<= k (- i1 1)))
             (not (= (select a k) true))))
        true false)))
  (= o9 false))))
  (or (not (= o9 true)) (exists ((o10 Int)) (= (to_rep a__last) o10)))))
  (exists ((a2 (Array Int Bool)) (i2 Int) (j2 Int))
  (and
  (and
  (and
  (and (and (<= (to_rep a__first) i2) (<= i2 (to_rep a__last)))
  (and (<= (to_rep a__first) j2) (<= j2 (to_rep a__last))))
  (forall ((k Int))
  (=> (and (<= (to_rep a__first) k) (<= k (- i2 1)))
  (not (= (select a2 k) true)))))
  (forall ((k Int))
  (=> (and (<= (+ j2 1) k) (<= k (to_rep a__last))) (= (select a2 k) true))))
  (and
  (= (and (ite (and (dynamic_invariant i2 false true true true)
               (dynamic_invariant j2 false true true true))
          true false) (ite (<= i2 j2) true false)) true)
  (exists ((temp___198 Int))
  (and (= temp___198 (- j2 i2))
  (exists ((i3 Int) (j3 Int))
  (and
  (and (and (<= (to_rep a__first) i2) (<= i2 (to_rep a__last)))
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= (select a2 i2) true) false true))
  (ite (= spark__branch1 true)
  (and (and (let ((o9 (+ i2 1))) (and (in_range2 o9) (= i3 o9))) (= a1 a2))
  (= j3 j2))
  (and (and (<= (to_rep a__first) j2) (<= j2 (to_rep a__last)))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (select a2 j2))
  (ite (= spark__branch2 true)
  (and (and (let ((o9 (- j2 1))) (and (in_range2 o9) (= j3 o9))) (= a1 a2))
  (= i3 i2))
  (exists ((o9 (Array Int Bool)))
  (and (= o9 a1)
  (and
  (and
  (and (= (= (select o9 i2) true) (= (select a2 j2) true))
  (= (= (select o9 j2) true) (= (select a2 i2) true)))
  (forall ((k Int))
  (=> (and (<= (to_rep a__first) k) (<= k (to_rep a__last)))
  (=> (and (not (= k i2)) (not (= k j2)))
  (= (= (select o9 k) true) (= (select a2 k) true))))))
  (let ((o10 (+ i2 1)))
  (and (in_range2 o10)
  (and (= i3 o10) (let ((o11 (- j2 1))) (and (in_range2 o11) (= j3 o11)))))))))))))))))
  (not (<= i3 j3)))))))))) (= a1 a)))))))))))))))))))
  (=> (= (to_rep a__first) o)
  (=> (= (to_rep a__last) o1)
  (=> (not (< o1 o))
  (=> (= (to_rep a__last) o2)
  (=> (= (to_rep a__first) o3)
  (=>
  (= (and (ite (<= o3 usf) true false) (ite (<= usf o2) true false)) true)
  (=> (= (to_rep a__first) o4)
  (=>
  (= (and (ite (<= o4 usf1) true false) (ite (<= usf1 usf) true false)) true)
  (<= (to_rep a__first) usf1))))))))))))))))
(check-sat)
(exit)
