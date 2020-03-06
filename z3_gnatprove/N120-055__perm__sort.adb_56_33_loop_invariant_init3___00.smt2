;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

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

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
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
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const values__first integer)

(declare-const values__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort index 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

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
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun of_array ((a (Array Int natural)) (f Int)
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

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(define-fun dynamic_invariant1 ((expr us_t) (us Bool) (skip_bounds Bool)
  (us1 Bool)
  (us2 Bool)) Bool (=> (not (= skip_bounds true)) (dynamic_property 1 100
                   (first1 expr) (last1 expr))))

(declare-fun occ (natural us_t) Int)

;; occ_empty
  (assert
  (forall ((v natural) (a us_t))
  (=> (< (last1 a) (first1 a)) (= (occ v a) 0))))

;; occ_set
  (assert
  (forall ((e natural) (v natural) (a us_t) (i Int))
  (let ((b (of_array (store (elts a) i v) (first1 a) (last1 a))))
  (=> (and (<= (first1 a) i) (<= i (last1 a)))
  (and
  (=> (not (= (select (elts a) i) e))
  (and (=> (not (= v e)) (= (occ e b) (occ e a)))
  (=> (= v e) (= (occ e b) (+ (occ e a) 1)))))
  (=> (= (select (elts a) i) e)
  (and (=> (not (= v e)) (= (occ e b) (- (occ e a) 1)))
  (=> (= v e) (= (occ e b) (occ e a))))))))))

(define-fun is_perm__logic ((a us_t)
  (b us_t)) Bool (ite (forall ((v natural)) (= (occ v a) (occ v b))) true
                 false))

(declare-fun index_of_minimum (us_t) Int)

(declare-fun index_of_minimum__function_guard (Int us_t) Bool)

;; index_of_minimum__post_axiom
  (assert
  (forall ((values us_t))
  (! (=>
     (and (dynamic_invariant1 values true true true true)
     (< 0 (length1 values)))
     (let ((result (index_of_minimum values)))
     (=> (index_of_minimum__function_guard result values)
     (and (and (<= (first1 values) result) (<= result (last1 values)))
     (in_range4 result))))) :pattern ((index_of_minimum values)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes () ((t11b__ref (t11b__refqtmk (t11b__content integer)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) integer 
  (t11b__content a))

(declare-datatypes () ((t13b__ref (t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const values (Array Int natural))

(declare-const smallest Int)

(declare-const values1 (Array Int natural))

;; H
  (assert (= values1 values))

;; Assume
  (assert (dynamic_property 1 100 (to_rep values__first)
  (to_rep values__last)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant smallest false false true true))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep values__last) o))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep values__first) o1))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= (length o1 o) 0) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const temp___190 Int)

;; Ensures
  (assert (= (to_rep values__first) temp___190))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep values__last) o2))

(define-fun o3 () Int (- o2 1))

;; Ensures
  (assert (in_range1 o3))

(declare-const current Int)

;; H
  (assert (= current temp___190))

;; H
  (assert
  (= (and (ite (<= temp___190 current) true false) (ite (<= current o3) true
                                                   false)) true))

(declare-const temp___loop_entry_199 (Array Int natural))

;; H
  (assert (= temp___loop_entry_199 values))

(declare-const temp___192 Int)

;; Ensures
  (assert (= (to_rep values__last) temp___192))

;; Assert
  (assert
  (=> (<= current temp___192)
  (and
  (and (<= (to_rep values__first) current)
  (<= current (to_rep values__last)))
  (and (<= (to_rep values__first) temp___192)
  (<= temp___192 (to_rep values__last))))))

(define-fun temp___193 () us_t (of_array values current temp___192))

(define-fun o4 () us_t (of_array (elts temp___193) (first1 temp___193)
                       (last1 temp___193)))

(define-fun o5 () Int (index_of_minimum o4))

;; H
  (assert (index_of_minimum__function_guard o5 o4))

;; H
  (assert (in_range4 o5))

;; H
  (assert (<= (first1 o4) o5))

;; H
  (assert (<= o5 (last1 o4)))

(declare-const smallest1 Int)

;; H
  (assert (= smallest1 o5))

(declare-const spark__branch1 Bool)

(declare-const values2 (Array Int natural))

;; H
  (assert (= spark__branch1 (ite (= smallest1 current) false true)))

(declare-const o6 (Array Int natural))

;; H
  (assert
  (ite (= spark__branch1 true)
  (and (in_range4 smallest1)
  (and (in_range4 current)
  (let ((o7 values__last))
  (let ((o8 values__first))
  (and (= o6 values2)
  (= (is_perm__logic (of_array values (to_rep o8) (to_rep o7))
     (of_array o6 (to_rep o8) (to_rep o7))) true))))))
  (= values2 values)))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep values__last) o7))

(declare-const o8 Int)

;; Ensures
  (assert (= (to_rep values__first) o8))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep values__last) o9))

(declare-const o10 Int)

;; Ensures
  (assert (= (to_rep values__first) o10))

(assert
;; defqtvc
 ;; File "sort.ads", line 6, characters 0-0
  (not
  (= (is_perm__logic
     (of_array temp___loop_entry_199 (to_rep values__first)
     (to_rep values__last))
     (of_array values2 (to_rep values__first) (to_rep values__last))) true)))
(check-sat)