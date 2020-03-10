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

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((my_array__ref 0))
(((my_array__refqtmk (my_array__content us_t)))))
(define-fun my_array__ref_my_array__content__projection ((a my_array__ref)) us_t 
  (my_array__content a))

(declare-datatypes ((constr_arr__ref 0))
(((constr_arr__refqtmk (constr_arr__content us_t)))))
(define-fun constr_arr__ref_constr_arr__content__projection ((a constr_arr__ref)) us_t 
  (constr_arr__content a))

(declare-datatypes ((constr_arr_2__ref 0))
(((constr_arr_2__refqtmk (constr_arr_2__content us_t)))))
(define-fun constr_arr_2__ref_constr_arr_2__content__projection ((a constr_arr_2__ref)) us_t 
  (constr_arr_2__content a))

(declare-const x__first integer)

(declare-const x__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y__first integer)

(declare-const y__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const u__first integer)

(declare-const u__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_183 us_t)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_180 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_183)
                                     (last1 temp___expr_183)))
                                     (=> (= temp___do_toplevel_181 true)
                                     (=> (= temp___is_init_179 true)
                                     (and (<= (first1 temp___expr_183) 1)
                                     (<= 3 (last1 temp___expr_183)))))))

(define-fun dynamic_predicate ((temp___186 us_t)) Bool (and
                                                       (<= (first1
                                                           temp___186) 1)
                                                       (<= 3 (last1
                                                             temp___186))))

(declare-sort t17b 0)

(declare-fun t17bqtint (t17b) Int)

;; t17b'axiom
  (assert
  (forall ((i t17b)) (and (<= 1 (t17bqtint i)) (<= (t17bqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (t17b t17b) Bool)

(declare-const dummy3 t17b)

(declare-datatypes ((t17b__ref 0))
(((t17b__refqtmk (t17b__content t17b)))))
(define-fun t17b__ref_t17b__content__projection ((a t17b__ref)) t17b 
  (t17b__content a))

(define-fun dynamic_predicate1 ((temp___269 (Array Int natural))) Bool 
  (and (<= 1 1) (<= 3 10)))

(declare-sort t19b 0)

(declare-fun t19bqtint (t19b) Int)

;; t19b'axiom
  (assert
  (forall ((i t19b)) (and (<= 1 (t19bqtint i)) (<= (t19bqtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (t19b t19b) Bool)

(declare-const dummy4 t19b)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content t19b)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) t19b 
  (t19b__content a))

(define-fun dynamic_predicate2 ((temp___271 (Array Int natural))) Bool 
  (and (and (<= 1 1) (<= 3 10)) (not (= (to_rep (select temp___271 3)) 0))))

(declare-sort t21b 0)

(declare-fun t21bqtint (t21b) Int)

;; t21b'axiom
  (assert
  (forall ((i t21b)) (and (<= 1 (t21bqtint i)) (<= (t21bqtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (t21b t21b) Bool)

(declare-const dummy5 t21b)

(declare-datatypes ((t21b__ref 0))
(((t21b__refqtmk (t21b__content t21b)))))
(define-fun t21b__ref_t21b__content__projection ((a t21b__ref)) t21b 
  (t21b__content a))

(define-fun dynamic_predicate3 ((temp___274 (Array Int natural))) Bool 
  (and (and (<= 1 1) (<= 3 10)) (not (= (to_rep (select temp___274 3)) 0))))

(define-fun dynamic_invariant1 ((temp___expr_192 us_t)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_189 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_192)
                                     (last1 temp___expr_192)))
                                     (ite (= temp___do_toplevel_190 true)
                                     (=> (= temp___is_init_188 true)
                                     (and
                                     (and (<= (first1 temp___expr_192) 1)
                                     (<= 3 (last1 temp___expr_192)))
                                     (not
                                     (= (to_rep
                                        (select (to_array temp___expr_192) 3)) 0))))
                                     (=> (= temp___is_init_188 true)
                                     (and (<= (first1 temp___expr_192) 1)
                                     (<= 3 (last1 temp___expr_192)))))))

(define-fun dynamic_predicate4 ((temp___197 us_t)) Bool (and
                                                        (and
                                                        (<= (first1
                                                            temp___197) 1)
                                                        (<= 3 (last1
                                                              temp___197)))
                                                        (not
                                                        (= (to_rep
                                                           (select (to_array
                                                                   temp___197) 3)) 0))))

(define-fun dynamic_invariant2 ((temp___expr_204 us_t)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_201 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_204)
                                     (last1 temp___expr_204)))
                                     (ite (= temp___do_toplevel_202 true)
                                     (=> (= temp___is_init_200 true)
                                     (and
                                     (and (<= (first1 temp___expr_204) 1)
                                     (<= 3 (last1 temp___expr_204)))
                                     (not
                                     (= (to_rep
                                        (select (to_array temp___expr_204) 3)) 0))))
                                     (=> (= temp___is_init_200 true)
                                     (and (<= (first1 temp___expr_204) 1)
                                     (<= 3 (last1 temp___expr_204)))))))

(define-fun dynamic_predicate5 ((temp___209 us_t)) Bool (and
                                                        (and
                                                        (<= (first1
                                                            temp___209) 1)
                                                        (<= 3 (last1
                                                              temp___209)))
                                                        (not
                                                        (= (to_rep
                                                           (select (to_array
                                                                   temp___209) 3)) 0))))

(declare-fun formals_arr_split_pred__x__aggregate_def (Int) (Array Int natural))

(declare-fun formals_arr_split_pred__y__aggregate_def (Int) (Array Int natural))

(declare-fun formals_arr_split_pred__u__aggregate_def (Int) (Array Int natural))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___278 Int))
  (=> (dynamic_invariant4 temp___278 true true true true)
  (forall ((temp___279 Int))
  (= (select (formals_arr_split_pred__x__aggregate_def temp___278) temp___279) 
  rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___284 Int))
  (=> (dynamic_invariant4 temp___284 true true true true)
  (forall ((temp___285 Int))
  (= (select (formals_arr_split_pred__y__aggregate_def temp___284) temp___285) 
  rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___293 Int))
  (=> (dynamic_invariant4 temp___293 true true true true)
  (forall ((temp___294 Int))
  (= (select (formals_arr_split_pred__u__aggregate_def temp___293) temp___294) 
  rliteral)))))

(assert
;; defqtvc
 ;; File "formals_arr_split_pred.adb", line 1, characters 0-0
  (not
  (let ((temp___280 (formals_arr_split_pred__x__aggregate_def 1)))
  (=> (dynamic_predicate1 temp___280)
  (let ((formals_arr_split_pred__x__assume (of_array temp___280 1 10)))
  (forall ((x (Array Int natural)))
  (=> (= x (to_array formals_arr_split_pred__x__assume))
  (=> (= (to_rep1 x__first) (first1 formals_arr_split_pred__x__assume))
  (=> (= (to_rep1 x__last) (last1 formals_arr_split_pred__x__assume))
  (=>
  (and (dynamic_property (- 2147483648) 2147483647 (to_rep1 x__first)
  (to_rep1 x__last))
  (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last))))
  (=> (dynamic_property (- 2147483648) 2147483647 1 10)
  (let ((temp___286 (formals_arr_split_pred__y__aggregate_def 1)))
  (=> (dynamic_predicate2 temp___286)
  (let ((temp___287 (of_array temp___286 1 10)))
  (=> (dynamic_predicate4 temp___287)
  (forall ((y (Array Int natural)))
  (=> (= y (to_array temp___287))
  (=> (= (to_rep1 y__first) (first1 temp___287))
  (=> (= (to_rep1 y__last) (last1 temp___287))
  (=>
  (and (dynamic_property (- 2147483648) 2147483647 (to_rep1 y__first)
  (to_rep1 y__last))
  (and (and (<= (to_rep1 y__first) 1) (<= 3 (to_rep1 y__last)))
  (not (= (to_rep (select y 3)) 0))))
  (let ((temp___295 (formals_arr_split_pred__u__aggregate_def 1)))
  (=> (dynamic_predicate3 temp___295)
  (let ((formals_arr_split_pred__u__assume (of_array temp___295 1 10)))
  (forall ((u (Array Int natural)))
  (=> (= u (to_array formals_arr_split_pred__u__assume))
  (=> (= (to_rep1 u__first) (first1 formals_arr_split_pred__u__assume))
  (=> (= (to_rep1 u__last) (last1 formals_arr_split_pred__u__assume))
  (=>
  (and (dynamic_property (- 2147483648) 2147483647 (to_rep1 u__first)
  (to_rep1 u__last))
  (and (and (<= (to_rep1 u__first) 1) (<= 3 (to_rep1 u__last)))
  (not (= (to_rep (select u 3)) 0))))
  (forall ((x1 (Array Int natural)) (o (Array Int natural)))
  (=> (= o x1)
  (=>
  (and (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (not (= (to_rep (select o 3)) 0)))
  (=> (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (=> (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (=> (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (=> (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (=> (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (forall ((x2 (Array Int natural)) (o1 (Array Int natural)))
  (=> (= o1 x2)
  (=>
  (and (and (<= (to_rep1 x__first) 1) (<= 3 (to_rep1 x__last)))
  (not (= (to_rep (select o1 3)) 0))) (<= (to_rep1 x__first) 1))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
