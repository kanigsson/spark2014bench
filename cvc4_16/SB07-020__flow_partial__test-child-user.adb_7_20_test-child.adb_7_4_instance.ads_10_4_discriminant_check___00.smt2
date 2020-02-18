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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun used (Int Int) Bool)

(declare-fun used__function_guard (Bool Int Int) Bool)

(declare-sort range_type 0)

(declare-fun range_typeqtint (range_type) Int)

;; range_type'axiom
  (assert
  (forall ((i range_type))
  (and (<= 0 (range_typeqtint i)) (<= (range_typeqtint i) 200))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 200)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (range_type range_type) Bool)

(declare-const dummy1 range_type)

(declare-datatypes ((range_type__ref 0))
(((range_type__refqtmk (range_type__content range_type)))))
(define-fun range_type__ref_range_type__content__projection ((a range_type__ref)) range_type 
  (range_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 200)) (in_range1 temp___expr_161)))

;; used__post_axiom
  (assert true)

;; used__def_axiom
  (assert
  (forall ((index Int) (instance__tc__last_allocated Int))
  (! (= (= (used index instance__tc__last_allocated) true)
     (<= index instance__tc__last_allocated)) :pattern ((used index
                                                        instance__tc__last_allocated)) )))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__instance__t__elem_type__kind Bool)))))
(define-fun us_split_discrs_rec__instance__t__elem_type__kind__projection ((a us_split_discrs)) Bool 
  (rec__instance__t__elem_type__kind a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__instance__t__elem_type__pos integer)))))
(define-fun us_split_fields_rec__instance__t__elem_type__pos__projection ((a us_split_fields)) integer 
  (rec__instance__t__elem_type__pos a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun instance__t__elem_type__pos__pred ((a us_rep)) Bool (= (ite 
  (rec__instance__t__elem_type__kind (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__instance__t__elem_type__kind
                                (us_split_discrs1 a)) 1 0) (ite (rec__instance__t__elem_type__kind
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (instance__t__elem_type__pos__pred a)
                        (= (to_rep
                           (rec__instance__t__elem_type__pos
                           (us_split_fields1 a))) (to_rep
                                                  (rec__instance__t__elem_type__pos
                                                  (us_split_fields1 b))))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const instance__t__elem_type__kind__first__bit Int)

(declare-const instance__t__elem_type__kind__last__bit Int)

(declare-const instance__t__elem_type__kind__position Int)

;; instance__t__elem_type__kind__first__bit_axiom
  (assert (<= 0 instance__t__elem_type__kind__first__bit))

;; instance__t__elem_type__kind__last__bit_axiom
  (assert
  (< instance__t__elem_type__kind__first__bit instance__t__elem_type__kind__last__bit))

;; instance__t__elem_type__kind__position_axiom
  (assert (<= 0 instance__t__elem_type__kind__position))

(declare-const instance__t__elem_type__pos__first__bit Int)

(declare-const instance__t__elem_type__pos__last__bit Int)

(declare-const instance__t__elem_type__pos__position Int)

;; instance__t__elem_type__pos__first__bit_axiom
  (assert (<= 0 instance__t__elem_type__pos__first__bit))

;; instance__t__elem_type__pos__last__bit_axiom
  (assert
  (< instance__t__elem_type__pos__first__bit instance__t__elem_type__pos__last__bit))

;; instance__t__elem_type__pos__position_axiom
  (assert (<= 0 instance__t__elem_type__pos__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((elem_type__ref 0))
(((elem_type__refqtmk (elem_type__content us_rep)))))
(define-fun elem_type__ref_elem_type__content__projection ((a elem_type__ref)) us_rep 
  (elem_type__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun kind (Int (Array Int us_rep)) Bool)

(declare-fun kind__function_guard (Bool Int (Array Int us_rep)) Bool)

(define-fun default_initial_assumption ((temp___expr_181 (Array Int us_rep))
  (temp___skip_top_level_182 Bool)) Bool (forall ((temp___183 Int))
                                         (=>
                                         (and (<= 0 temp___183)
                                         (<= temp___183 200))
                                         (= (rec__instance__t__elem_type__kind
                                            (us_split_discrs1
                                            (select temp___expr_181 temp___183))) (distinct 0 0)))))

;; kind__post_axiom
  (assert true)

;; kind__def_axiom
  (assert
  (forall ((index Int))
  (forall ((instance__tc__elems (Array Int us_rep)))
  (! (= (= (kind index instance__tc__elems) true)
     (= (rec__instance__t__elem_type__kind
        (us_split_discrs1 (select instance__tc__elems index))) true)) :pattern (
  (kind index instance__tc__elems)) ))))

(declare-const index Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun default_initial_assumption1 ((temp___expr_170 us_rep)
  (temp___skip_top_level_171 Bool)) Bool (= (rec__instance__t__elem_type__kind
                                            (us_split_discrs1
                                            temp___expr_170)) (distinct 0 0)))

(assert
;; defqtvc
 ;; File "test-child-user.ads", line 7, characters 0-0
  (not
  (forall ((last_allocated Int) (elems (Array Int us_rep)))
  (=> (dynamic_invariant1 last_allocated true false true true)
  (=> (dynamic_invariant1 index true false true true)
  (=> (dynamic_invariant value true false true true)
  (=>
  (forall ((elems1 (Array Int us_rep))) (kind__function_guard
  (kind index elems1) index elems1))
  (=> (= (kind index elems) true)
  (=>
  (forall ((last_allocated1 Int)) (used__function_guard
  (used index last_allocated1) index last_allocated1))
  (=> (= (used index last_allocated) true) (instance__t__elem_type__pos__pred
  (select elems index))))))))))))
(check-sat)