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

(declare-sort set_length 0)

(declare-fun set_lengthqtint (set_length) Int)

;; set_length'axiom
  (assert
  (forall ((i set_length))
  (and (<= 0 (set_lengthqtint i)) (<= (set_lengthqtint i) 10))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (set_length set_length) Bool)

(declare-const dummy set_length)

(declare-datatypes ((set_length__ref 0))
(((set_length__refqtmk (set_length__content set_length)))))
(define-fun set_length__ref_set_length__content__projection ((a set_length__ref)) set_length 
  (set_length__content a))

(define-fun to_rep ((x set_length)) Int (set_lengthqtint x))

(declare-fun of_rep (Int) set_length)

;; inversion_axiom
  (assert
  (forall ((x set_length))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x set_length)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort element_t 0)

(declare-fun element_tqtint (element_t) Int)

;; element_t'axiom
  (assert
  (forall ((i element_t))
  (and (<= (- 1) (element_tqtint i)) (<= (element_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1) x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (element_t element_t) Bool)

(declare-const dummy1 element_t)

(declare-datatypes ((element_t__ref 0))
(((element_t__refqtmk (element_t__content element_t)))))
(define-fun element_t__ref_element_t__content__projection ((a element_t__ref)) element_t 
  (element_t__content a))

(define-fun to_rep1 ((x element_t)) Int (element_tqtint x))

(declare-fun of_rep1 (Int) element_t)

;; inversion_axiom
  (assert
  (forall ((x element_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_t)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element_t))))))
(declare-fun slide ((Array Int element_t) Int Int) (Array Int element_t))

;; slide_eq
  (assert
  (forall ((a (Array Int element_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element_t)) (a__first Int) (a__last Int)
  (b (Array Int element_t)) (b__first Int)
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
  (forall ((a (Array Int element_t)) (b (Array Int element_t)))
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

(declare-const dummy2 (Array Int element_t))

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

(declare-fun user_eq2 ((Array Int element_t) (Array Int element_t)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__natural_set__t__len set_length)(rec__natural_set__t__m (Array Int element_t))))))
(define-fun us_split_fields_rec__natural_set__t__len__projection ((a us_split_fields)) set_length 
  (rec__natural_set__t__len a))

(define-fun us_split_fields_rec__natural_set__t__m__projection ((a us_split_fields)) (Array Int element_t) 
  (rec__natural_set__t__m a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__natural_set__t__len (us_split_fields1 a))) 
                        (to_rep
                        (rec__natural_set__t__len (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__natural_set__t__m (us_split_fields1 a)) 1 10
                           (rec__natural_set__t__m (us_split_fields1 b)) 1
                           10) true))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const natural_set__t__len__first__bit Int)

(declare-const natural_set__t__len__last__bit Int)

(declare-const natural_set__t__len__position Int)

;; natural_set__t__len__first__bit_axiom
  (assert (<= 0 natural_set__t__len__first__bit))

;; natural_set__t__len__last__bit_axiom
  (assert (< natural_set__t__len__first__bit natural_set__t__len__last__bit))

;; natural_set__t__len__position_axiom
  (assert (<= 0 natural_set__t__len__position))

(declare-const natural_set__t__m__first__bit Int)

(declare-const natural_set__t__m__last__bit Int)

(declare-const natural_set__t__m__position Int)

;; natural_set__t__m__first__bit_axiom
  (assert (<= 0 natural_set__t__m__first__bit))

;; natural_set__t__m__last__bit_axiom
  (assert (< natural_set__t__m__first__bit natural_set__t__m__last__bit))

;; natural_set__t__m__position_axiom
  (assert (<= 0 natural_set__t__m__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= (- 1) 2147483647)) (in_range1
                                     temp___expr_177)))

(define-fun dynamic_invariant1 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 10)) (in_range temp___expr_163)))

(assert
;; defqtvc
 ;; File "natural_set.ads", line 9, characters 0-0
  (not
  (forall ((o Int) (natural_set__members__result Int))
  (=> (= (to_rep (rec__natural_set__t__len (us_split_fields1 s))) o)
  (=> (= natural_set__members__result o) (<= 0 natural_set__members__result))))))
(check-sat)