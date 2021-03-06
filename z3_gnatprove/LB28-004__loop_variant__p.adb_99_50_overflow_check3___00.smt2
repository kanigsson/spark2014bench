(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a1 first first) a1) :pattern ((slide a1 first first)) ))))

;; slide_def
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a1 old_first new_first) i) (select a1 (- i (- new_first old_first)))) :pattern ((select 
  (slide a1 old_first new_first) i)) ))))))

(define-fun bool_eq ((a1 (Array Int integer)) (a__first Int) (a__last Int)
  (b1 (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a1 temp___idx_154)) (to_rep
                                                                  (select b1 (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a1 (Array Int integer)) (b1 (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b1 b__first b__last a1 a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a1 temp___idx_154)) (to_rep
                                         (select b1 (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const tab__first integer)

(declare-const tab__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes () ((ttD1__ref (ttD1__refqtmk (ttD1__content integer)))))
(define-fun ttD1__ref_ttD1__content__projection ((a1 ttD1__ref)) integer 
  (ttD1__content a1))

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

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a1 us_t)) (Array Int integer) (elts a1))

(define-fun of_array ((a1 (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a1 (mk f l)))

(define-fun first1 ((a1 us_t)) Int (to_rep (first (rt a1))))

(define-fun last1 ((a1 us_t)) Int (to_rep (last (rt a1))))

(define-fun length ((a1 us_t)) Int (ite (<= (first1 a1) (last1 a1))
                                   (+ (- (last1 a1) (first1 a1)) 1) 0))

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

(declare-datatypes () ((ttB__ref (ttB__refqtmk (ttB__content us_t)))))
(define-fun ttB__ref_ttB__content__projection ((a1 ttB__ref)) us_t (ttB__content
                                                                   a1))

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_t)))))
(define-fun t__ref_t__content__projection ((a1 t__ref)) us_t (t__content a1))

(define-fun dynamic_invariant1 ((temp___expr_159 us_t)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (not (= temp___skip_constant_156 true))
                                     (and (dynamic_property1 a b
                                     (first1 temp___expr_159)
                                     (last1 temp___expr_159))
                                     (and (= (first1 temp___expr_159) 
                                     a) (= (last1 temp___expr_159) b)))))

(define-fun default_initial_assumption ((temp___expr_161 us_t)
  (temp___skip_top_level_162 Bool)) Bool (and (= (first1 temp___expr_161) 
                                         a) (= (last1 temp___expr_161) 
                                         b)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(declare-const tab (Array Int integer))

(declare-const j Int)

(declare-const k Int)

;; Assume
  (assert (dynamic_invariant a true false true true))

;; Assume
  (assert (dynamic_invariant b true false true true))

;; Assume
  (assert (default_initial_assumption
  (of_array tab (to_rep tab__first) (to_rep tab__last)) false))

;; Assume
  (assert
  (and (dynamic_property1 a b (to_rep tab__first) (to_rep tab__last))
  (and (= (to_rep tab__first) a) (= (to_rep tab__last) b))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant j false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant k false false true true))

(declare-const j1 Int)

;; H
  (assert (= j1 a))

(declare-const tab1 (Array Int integer))

(declare-const j2 Int)

;; H
  (assert
  (ite (<= j1 b)
  (exists ((o integer))
  (and (= (to_rep o) j1)
  (and (and (<= (to_rep tab__first) j1) (<= j1 (to_rep tab__last)))
  (exists ((tab2 (Array Int integer)))
  (and (= tab2 (store tab j1 o))
  (let ((o1 (+ j1 1)))
  (and (in_range1 o1)
  (exists ((j3 Int))
  (and (= j3 o1)
  (and (dynamic_invariant j2 false true true true)
  (exists ((temp___171 Int)) (and (= temp___171 j2) (not (<= j2 b))))))))))))))
  (and (= tab1 tab) (= j2 j1))))

(declare-const j3 Int)

;; H
  (assert (= j3 a))

(declare-const k1 Int)

;; H
  (assert (= k1 0))

(declare-const tab2 (Array Int integer))

(declare-const j4 Int)

(declare-const k2 Int)

;; H
  (assert (in_range1 (+ j3 k1)))

;; H
  (assert
  (ite (<= (+ j3 k1) b)
  (let ((o (+ j3 k1)))
  (and (in_range1 o)
  (and (and (<= (to_rep tab__first) o) (<= o (to_rep tab__last)))
  (exists ((tab3 (Array Int integer)))
  (and (= tab3 (store tab1 o rliteral))
  (exists ((spark__branch Bool) (j5 Int) (k3 Int))
  (and
  (and (= spark__branch (ite (< j3 100) true false))
  (ite (= spark__branch true)
  (and (let ((o1 (+ j3 1))) (and (in_range1 o1) (= j5 o1))) (= k3 k1))
  (and (let ((o1 (+ k1 1))) (and (in_range1 o1) (= k3 o1))) (= j5 j3))))
  (and
  (and (dynamic_invariant k2 false true true true) (dynamic_invariant 
  j4 false true true true))
  (exists ((temp___179 Int))
  (and (= temp___179 j4)
  (exists ((temp___178 Int))
  (and (= temp___178 k2)
  (let ((o1 (+ j4 k2))) (and (in_range1 o1) (not (<= o1 b))))))))))))))))
  (and (and (= tab2 tab1) (= j4 j3)) (= k2 k1))))

(declare-const j5 Int)

;; H
  (assert (= j5 a))

(declare-const k3 Int)

;; H
  (assert (= k3 0))

(declare-const tab3 (Array Int integer))

(declare-const j6 Int)

(declare-const k4 Int)

;; H
  (assert
  (ite (<= j5 b)
  (exists ((o integer))
  (and (= (to_rep o) j5)
  (and (and (<= (to_rep tab__first) j5) (<= j5 (to_rep tab__last)))
  (exists ((tab4 (Array Int integer)))
  (and (= tab4 (store tab2 j5 o))
  (let ((o1 (+ j5 1)))
  (and (in_range1 o1)
  (exists ((j7 Int))
  (and (= j7 o1)
  (let ((o2 (+ k3 1)))
  (and (in_range1 o2)
  (exists ((k5 Int))
  (and (= k5 o2)
  (and
  (and (dynamic_invariant k4 false true true true) (dynamic_invariant 
  j6 false true true true))
  (exists ((temp___185 Int))
  (and (= temp___185 j6)
  (exists ((temp___186 Int)) (and (= temp___186 k4) (not (<= j6 b))))))))))))))))))))
  (and (and (= tab3 tab2) (= j6 j5)) (= k4 k3))))

(declare-const j7 Int)

;; H
  (assert (= j7 a))

(declare-const tab4 (Array Int integer))

(declare-const j8 Int)

;; H
  (assert
  (ite (<= j7 b)
  (exists ((o integer))
  (and (= (to_rep o) j7)
  (and (and (<= (to_rep tab__first) j7) (<= j7 (to_rep tab__last)))
  (exists ((tab5 (Array Int integer)))
  (and (= tab5 (store tab3 j7 o))
  (let ((o1 (+ j7 1)))
  (and (in_range1 o1)
  (exists ((j9 Int))
  (and (= j9 o1)
  (and (in_range1 (- j9 1))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j8 1))) (= (to_rep (select tab4 l)) l)))
  (and (dynamic_invariant j8 false true true true)
  (exists ((temp___192 Int)) (and (= temp___192 j8) (not (<= j8 b))))))))))))))))
  (and (= tab4 tab3) (= j8 j7))))

(declare-const j9 Int)

;; H
  (assert (= j9 a))

(declare-const tab5 (Array Int integer))

(declare-const j10 Int)

;; H
  (assert
  (ite (<= j9 b)
  (exists ((o integer))
  (and (= (to_rep o) j9)
  (and (and (<= (to_rep tab__first) j9) (<= j9 (to_rep tab__last)))
  (exists ((tab6 (Array Int integer)))
  (and (= tab6 (store tab4 j9 o))
  (let ((o1 (+ j9 1)))
  (and (in_range1 o1)
  (exists ((j11 Int))
  (and (= j11 o1)
  (and (in_range1 (- j11 1))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j10 1))) (= (to_rep (select tab5 l)) l)))
  (and (dynamic_invariant j10 false true true true)
  (exists ((temp___198 Int)) (and (= temp___198 j10) (not (<= j10 b))))))))))))))))
  (and (= tab5 tab4) (= j10 j9))))

(declare-const j11 Int)

;; H
  (assert (= j11 a))

(declare-const k5 Int)

;; H
  (assert (= k5 0))

(declare-const tab6 (Array Int integer))

(declare-const j12 Int)

(declare-const k6 Int)

;; H
  (assert
  (ite (<= j11 b)
  (exists ((o integer))
  (and (= (to_rep o) j11)
  (and (and (<= (to_rep tab__first) j11) (<= j11 (to_rep tab__last)))
  (exists ((tab7 (Array Int integer)))
  (and (= tab7 (store tab5 j11 o))
  (let ((o1 (+ j11 1)))
  (and (in_range1 o1)
  (exists ((j13 Int))
  (and (= j13 o1)
  (let ((o2 (+ k5 1)))
  (and (in_range1 o2)
  (exists ((k7 Int))
  (and (= k7 o2)
  (and (in_range1 (+ a k7))
  (and
  (and (= j12 (+ a k6))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j12 1))) (= (to_rep (select tab6 l)) l)))
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- (+ a k6) 1))) (= (to_rep (select tab6 l)) l)))))
  (and
  (and (dynamic_invariant k6 false true true true) (dynamic_invariant 
  j12 false true true true))
  (exists ((temp___207 Int))
  (and (= temp___207 j12)
  (exists ((temp___208 Int)) (and (= temp___208 k6) (not (<= j12 b))))))))))))))))))))))
  (and (and (= tab6 tab5) (= j12 j11)) (= k6 k5))))

(declare-const j13 Int)

;; H
  (assert (= j13 a))

(declare-const k7 Int)

;; H
  (assert (= k7 0))

(declare-const tab7 (Array Int integer))

(declare-const j14 Int)

(declare-const k8 Int)

;; H
  (assert
  (ite (<= j13 b)
  (exists ((o integer))
  (and (= (to_rep o) j13)
  (and (and (<= (to_rep tab__first) j13) (<= j13 (to_rep tab__last)))
  (exists ((tab8 (Array Int integer)))
  (and (= tab8 (store tab6 j13 o))
  (let ((o1 (+ j13 1)))
  (and (in_range1 o1)
  (exists ((j15 Int))
  (and (= j15 o1)
  (let ((o2 (+ k7 1)))
  (and (in_range1 o2)
  (exists ((k9 Int))
  (and (= k9 o2)
  (and (in_range1 (+ a k9))
  (and
  (and (= j14 (+ a k8))
  (and
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- j14 1))) (= (to_rep (select tab7 l)) l)))
  (forall ((l Int))
  (=> (and (<= a l) (<= l (- (+ a k8) 1))) (= (to_rep (select tab7 l)) l)))))
  (and
  (and (dynamic_invariant k8 false true true true) (dynamic_invariant 
  j14 false true true true))
  (exists ((temp___217 Int))
  (and (= temp___217 j14)
  (exists ((temp___218 Int)) (and (= temp___218 k8) (not (<= j14 b))))))))))))))))))))))
  (and (and (= tab7 tab6) (= j14 j13)) (= k8 k7))))

(declare-const j15 Int)

;; H
  (assert (= j15 a))

(declare-const k9 Int)

;; H
  (assert (= k9 0))

;; H
  (assert (<= j15 b))

(declare-const o integer)

;; Ensures
  (assert (= (to_rep o) j15))

;; Assert
  (assert (and (<= (to_rep tab__first) j15) (<= j15 (to_rep tab__last))))

(declare-const tab8 (Array Int integer))

;; H
  (assert (= tab8 (store tab7 j15 o)))

(define-fun o1 () Int (+ j15 1))

;; Ensures
  (assert (in_range1 o1))

(declare-const j16 Int)

;; H
  (assert (= j16 o1))

(define-fun o2 () Int (+ k9 1))

;; Ensures
  (assert (in_range1 o2))

(declare-const k10 Int)

;; H
  (assert (= k10 o2))

(define-fun o3 () Int (+ a k10))

;; Ensures
  (assert (in_range1 o3))

;; Ensures
  (assert (in_range1 (- j16 1)))

(declare-const usf Int)

(define-fun o4 () Int (+ a k10))

(assert
;; defqtvc
 ;; File "p.adb", line 1, characters 0-0
  (not (in_range1 o4)))
(check-sat)

(exit)
