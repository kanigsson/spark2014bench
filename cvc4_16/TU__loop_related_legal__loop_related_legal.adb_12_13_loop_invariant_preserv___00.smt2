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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tarray_tD1 0)

(declare-fun tarray_tD1qtint (tarray_tD1) Int)

;; tarray_tD1'axiom
  (assert
  (forall ((i tarray_tD1))
  (and (<= 1 (tarray_tD1qtint i)) (<= (tarray_tD1qtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tarray_tD1 tarray_tD1) Bool)

(declare-const dummy2 tarray_tD1)

(declare-datatypes ((tarray_tD1__ref 0))
(((tarray_tD1__refqtmk (tarray_tD1__content tarray_tD1)))))
(define-fun tarray_tD1__ref_tarray_tD1__content__projection ((a tarray_tD1__ref)) tarray_tD1 
  (tarray_tD1__content a))

(declare-sort t8b 0)

(declare-fun t8bqtint (t8b) Int)

;; t8b'axiom
  (assert (forall ((i t8b)) (and (<= 1 (t8bqtint i)) (<= (t8bqtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (t8b t8b) Bool)

(declare-const dummy3 t8b)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content t8b)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) t8b (t8b__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "loop_related_legal.adb", line 5, characters 0-0
  (not
  (forall ((arr (Array Int natural)) (n Int)
  (temp___loop_entry_171 (Array Int natural)) (spark__branch Bool)
  (arr1 (Array Int natural)) (arr2 (Array Int natural)) (n1 Int) (n2 Int)
  (arr3 (Array Int natural)) (i Int))
  (=> (= n 1)
  (=> (= (and (ite (<= 1 n) true false) (ite (<= n 10) true false)) true)
  (=> (= temp___loop_entry_171 arr)
  (=>
  (exists ((o Int))
  (and (= (to_rep (select arr n)) o)
  (and (= spark__branch (ite (< o 2147483647) true false))
  (ite (= spark__branch true)
  (exists ((o1 Int))
  (and (= (to_rep (select arr n)) o1)
  (let ((o2 (+ o1 1)))
  (and (in_range1 o2)
  (exists ((o3 natural)) (and (= (to_rep o3) o2) (= arr1 (store arr n o3))))))))
  (= arr1 arr)))))
  (=>
  (forall ((i1 Int))
  (=> (and (<= 1 i1) (<= i1 10))
  (<= (to_rep (select temp___loop_entry_171 i1)) (to_rep (select arr2 i1)))))
  (=>
  (= (and (ite (and
               (forall ((temp___168 Int))
               (=> (and (<= 1 temp___168) (<= temp___168 10))
               (=>
               (or (< 10 temp___168) (or (< temp___168 1) (< n1 temp___168)))
               (= (select arr2 temp___168) (select arr temp___168)))))
               (in_range4 n1))
          true false) (ite (and (<= 1 n1) (<= n1 10)) true false)) true)
  (=> (not (= n1 10))
  (=> (= n2 (+ n1 1))
  (=>
  (exists ((o Int))
  (and (= (to_rep (select arr2 n2)) o)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (< o 2147483647) true false))
  (ite (= spark__branch1 true)
  (exists ((o1 Int))
  (and (= (to_rep (select arr2 n2)) o1)
  (let ((o2 (+ o1 1)))
  (and (in_range1 o2)
  (exists ((o3 natural))
  (and (= (to_rep o3) o2) (= arr3 (store arr2 n2 o3)))))))) (= arr3 arr2))))))
  (=> (<= 1 i)
  (=> (<= i 10)
  (<= (to_rep (select temp___loop_entry_171 i)) (to_rep (select arr3 i)))))))))))))))))
(check-sat)