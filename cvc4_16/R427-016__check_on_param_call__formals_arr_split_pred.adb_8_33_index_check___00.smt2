;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

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
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-datatypes ((constr_arr_2__ref 0))
(((constr_arr_2__refqtmk (constr_arr_2__content us_t)))))
(define-fun constr_arr_2__ref_constr_arr_2__content__projection ((a constr_arr_2__ref)) us_t 
  (constr_arr_2__content a))

(declare-const i9b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_204 us_t)
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

(define-fun dynamic_predicate ((temp___209 us_t)) Bool (and
                                                       (and
                                                       (<= (first1
                                                           temp___209) 1)
                                                       (<= 3 (last1
                                                             temp___209)))
                                                       (not
                                                       (= (to_rep
                                                          (select (to_array
                                                                  temp___209) 3)) 0))))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(assert
;; defqtvc
 ;; File "formals_arr_split_pred.adb", line 7, characters 0-0
  (not
  (=> (dynamic_invariant i9b true false false true) (<= (first1 i9b) 3))))
(check-sat)