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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                             (of_rep2 x))) )))

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= (- 2147483648) (elementqtint i)) (<= (elementqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (element element) Bool)

(declare-const dummy3 element)

(declare-datatypes ((element__ref 0))
(((element__refqtmk (element__content element)))))
(define-fun element__ref_element__content__projection ((a element__ref)) element 
  (element__content a))

(define-fun to_rep3 ((x element)) Int (elementqtint x))

(declare-fun of_rep3 (Int) element)

;; inversion_axiom
  (assert
  (forall ((x element))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x element)) (! (in_range3 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element))))))
(declare-fun slide ((Array Int element) Int Int) (Array Int element))

;; slide_eq
  (assert
  (forall ((a (Array Int element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element)) (a__first Int) (a__last Int)
  (b (Array Int element)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep3 (select a temp___idx_154)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int element)) (b (Array Int element)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep3 (select a temp___idx_154)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int element))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int element) (elts a))

(define-fun of_array ((a (Array Int element)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((elements__ref 0))
(((elements__refqtmk (elements__content us_t)))))
(define-fun elements__ref_elements__content__projection ((a elements__ref)) us_t 
  (elements__content a))

(declare-datatypes ((t20s__ref 0))
(((t20s__refqtmk (t20s__content us_t)))))
(define-fun t20s__ref_t20s__content__projection ((a t20s__ref)) us_t 
  (t20s__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__stacks__stack__max positive)))))
(define-fun us_split_discrs_rec__stacks__stack__max__projection ((a us_split_discrs)) positive 
  (rec__stacks__stack__max a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stacks__stack__top natural)(rec__stacks__stack__data us_t)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__stacks__stack__top__projection ((a us_split_fields)) natural 
  (rec__stacks__stack__top a))

(define-fun us_split_fields_rec__stacks__stack__data__projection ((a us_split_fields)) us_t 
  (rec__stacks__stack__data a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__stacks__stack__max (us_split_discrs1 a))) 
                        (to_rep1
                        (rec__stacks__stack__max (us_split_discrs1 b))))
                        (and
                        (= (to_rep
                           (rec__stacks__stack__top (us_split_fields1 a))) 
                        (to_rep
                        (rec__stacks__stack__top (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__stacks__stack__data (us_split_fields1 a))
                           (rec__stacks__stack__data (us_split_fields1 b))) true)))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stacks__stack__max__first__bit Int)

(declare-const stacks__stack__max__last__bit Int)

(declare-const stacks__stack__max__position Int)

;; stacks__stack__max__first__bit_axiom
  (assert (<= 0 stacks__stack__max__first__bit))

;; stacks__stack__max__last__bit_axiom
  (assert (< stacks__stack__max__first__bit stacks__stack__max__last__bit))

;; stacks__stack__max__position_axiom
  (assert (<= 0 stacks__stack__max__position))

(declare-const stacks__stack__top__first__bit Int)

(declare-const stacks__stack__top__last__bit Int)

(declare-const stacks__stack__top__position Int)

;; stacks__stack__top__first__bit_axiom
  (assert (<= 0 stacks__stack__top__first__bit))

;; stacks__stack__top__last__bit_axiom
  (assert (< stacks__stack__top__first__bit stacks__stack__top__last__bit))

;; stacks__stack__top__position_axiom
  (assert (<= 0 stacks__stack__top__position))

(declare-const stacks__stack__data__first__bit Int)

(declare-const stacks__stack__data__last__bit Int)

(declare-const stacks__stack__data__position Int)

;; stacks__stack__data__first__bit_axiom
  (assert (<= 0 stacks__stack__data__first__bit))

;; stacks__stack__data__last__bit_axiom
  (assert (< stacks__stack__data__first__bit stacks__stack__data__last__bit))

;; stacks__stack__data__position_axiom
  (assert (<= 0 stacks__stack__data__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((stack__ref 0))
(((stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

(declare-fun size1 (Int us_rep) Int)

(declare-fun size__function_guard1 (Int Int us_rep) Bool)

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

(declare-fun is_full1 (Int us_rep) Bool)

(declare-fun is_full__function_guard1 (Bool Int us_rep) Bool)

(define-fun in_range4 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Bool)

(define-fun dynamic_invariant ((temp___expr_180 us_rep)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (let ((temp___181 (rec__stacks__stack__max
                                                       (us_split_discrs1
                                                       temp___expr_180))))
                                     (and (dynamic_property 1
                                     (to_rep1 temp___181)
                                     (first1
                                     (rec__stacks__stack__data
                                     (us_split_fields1 temp___expr_180)))
                                     (last1
                                     (rec__stacks__stack__data
                                     (us_split_fields1 temp___expr_180))))
                                     (and
                                     (= (first1
                                        (rec__stacks__stack__data
                                        (us_split_fields1 temp___expr_180))) 1)
                                     (= (last1
                                        (rec__stacks__stack__data
                                        (us_split_fields1 temp___expr_180))) 
                                     (to_rep1 temp___181))))))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__stacks__stack__top1 natural)(rec__stacks__stack__data1 us_t)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__stacks__stack__top__2__projection ((a us_split_fields2)) natural 
  (rec__stacks__stack__top1 a))

(define-fun us_split_fields_rec__stacks__stack__data__2__projection ((a us_split_fields2)) us_t 
  (rec__stacks__stack__data1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (us_private) us_private)

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__stacks__stack__top1
                                         (us_split_fields3 a))
                                         (let ((temp___162 (rec__stacks__stack__data1
                                                           (us_split_fields3
                                                           a))))
                                         (of_array (to_array temp___162)
                                         (first1 temp___162)
                                         (last1 temp___162)))
                                         (hide_ext__
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (rec__stacks__stack__top
                                         (us_split_fields1 r))
                                         (let ((temp___161 (rec__stacks__stack__data
                                                           (us_split_fields1
                                                           r))))
                                         (of_array (to_array temp___161)
                                         (first1 temp___161)
                                         (last1 temp___161)))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__stacks__stack__max (us_split_discrs2 a))) 
                         (to_rep1
                         (rec__stacks__stack__max (us_split_discrs2 b))))
                         (and
                         (= (to_rep
                            (rec__stacks__stack__top1 (us_split_fields3 a))) 
                         (to_rep
                         (rec__stacks__stack__top1 (us_split_fields3 b))))
                         (= (bool_eq1
                            (rec__stacks__stack__data1 (us_split_fields3 a))
                            (rec__stacks__stack__data1 (us_split_fields3 b))) true)))
                    true false))

(declare-const us_tag1 Int)

(define-fun in_range5 ((rec__stacks__stack__max1 Int)
  (a us_rep)) Bool (= rec__stacks__stack__max1 (to_rep1
                                               (rec__stacks__stack__max
                                               (us_split_discrs1 a)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const stacks__stack__max__first__bit1 Int)

(declare-const stacks__stack__max__last__bit1 Int)

(declare-const stacks__stack__max__position1 Int)

;; stacks__stack__max__first__bit_axiom
  (assert (<= 0 stacks__stack__max__first__bit1))

;; stacks__stack__max__last__bit_axiom
  (assert (< stacks__stack__max__first__bit1 stacks__stack__max__last__bit1))

;; stacks__stack__max__position_axiom
  (assert (<= 0 stacks__stack__max__position1))

(declare-const stacks__stack__top__first__bit1 Int)

(declare-const stacks__stack__top__last__bit1 Int)

(declare-const stacks__stack__top__position1 Int)

;; stacks__stack__top__first__bit_axiom
  (assert (<= 0 stacks__stack__top__first__bit1))

;; stacks__stack__top__last__bit_axiom
  (assert (< stacks__stack__top__first__bit1 stacks__stack__top__last__bit1))

;; stacks__stack__top__position_axiom
  (assert (<= 0 stacks__stack__top__position1))

(declare-const stacks__stack__data__first__bit1 Int)

(declare-const stacks__stack__data__last__bit1 Int)

(declare-const stacks__stack__data__position1 Int)

;; stacks__stack__data__first__bit_axiom
  (assert (<= 0 stacks__stack__data__first__bit1))

;; stacks__stack__data__last__bit_axiom
  (assert
  (< stacks__stack__data__first__bit1 stacks__stack__data__last__bit1))

;; stacks__stack__data__position_axiom
  (assert (<= 0 stacks__stack__data__position1))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((s3b__ref 0))
(((s3b__refqtmk (s3b__content us_rep1)))))
(define-fun s3b__ref_s3b__content__projection ((a s3b__ref)) us_rep1 
  (s3b__content a))

;; is_full__post_axiom
  (assert true)

;; is_full__post__dispatch_axiom
  (assert true)

;; stacks__stack__compat_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (is_full__function_guard1 (is_full1 us_tag s) us_tag s)
     (and (forall ((s1 us_rep)) (is_full__function_guard (is_full s1) s1))
     (= (ite (is_full s) 1 0) (ite (is_full1 us_tag s) 1 0)))) :pattern (
  (is_full1 us_tag s)) )))

;; stacks__print__S3b__compat_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (is_full__function_guard1 (is_full1 us_tag1 s) us_tag1 s)
     (and (forall ((s1 us_rep)) (is_full__function_guard (is_full s1) s1))
     (= (ite (is_full s) 1 0) (ite (is_full1 us_tag1 s) 1 0)))) :pattern (
  (is_full1 us_tag1 s)) )))

;; is_full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (= (= (is_full s) true)
     (= (size s) (to_rep1 (rec__stacks__stack__max (us_split_discrs1 s)))))) :pattern (
  (is_full s)) )))

(declare-const s__split_discrs us_split_discrs)

(declare-const s__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_167)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; size__post_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (size s)))
     (=> (size__function_guard result s) (dynamic_invariant2 result true
     false true true)))) :pattern ((size s)) )))

;; size__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((s us_rep))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (size1 attr__tag2 s)))
     (=> (size__function_guard1 result attr__tag2 s) (dynamic_invariant2
     result true false true true)))) :pattern ((size1 attr__tag2 s)) ))))

;; stacks__stack__compat_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (size__function_guard1 (size1 us_tag s) us_tag s)
     (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (= (size s) (size1 us_tag s)))) :pattern ((size1 us_tag s)) )))

;; stacks__print__S3b__compat_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (size__function_guard1 (size1 us_tag1 s) us_tag1 s)
     (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (= (size s) (size1 us_tag1 s)))) :pattern ((size1 us_tag1 s)) )))

;; size__def_axiom
  (assert
  (forall ((s us_rep))
  (! (=> (dynamic_invariant s true true true true)
     (= (size s) (to_rep (rec__stacks__stack__top (us_split_fields1 s))))) :pattern (
  (size s)) )))

(declare-const s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant5 ((temp___expr_272 us_rep1)
  (temp___is_init_268 Bool) (temp___skip_constant_269 Bool)
  (temp___do_toplevel_270 Bool)
  (temp___do_typ_inv_271 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_269 true))
                                     (in_range5
                                     (to_rep1
                                     (rec__stacks__stack__max
                                     (us_split_discrs1 s)))
                                     (to_base temp___expr_272)))
                                     (and (dynamic_property 1
                                     (to_rep1
                                     (rec__stacks__stack__max
                                     (us_split_discrs1 s)))
                                     (first1
                                     (rec__stacks__stack__data1
                                     (us_split_fields3 temp___expr_272)))
                                     (last1
                                     (rec__stacks__stack__data1
                                     (us_split_fields3 temp___expr_272))))
                                     (and
                                     (= (first1
                                        (rec__stacks__stack__data1
                                        (us_split_fields3 temp___expr_272))) 1)
                                     (= (last1
                                        (rec__stacks__stack__data1
                                        (us_split_fields3 temp___expr_272))) 
                                     (to_rep1
                                     (rec__stacks__stack__max
                                     (us_split_discrs1 s))))))))

(define-fun default_initial_assumption ((temp___expr_275 us_rep1)
  (temp___skip_top_level_276 Bool)) Bool (and
                                         (= (attr__tag1 temp___expr_275) 
                                         us_tag1)
                                         (and
                                         (= (to_rep1
                                            (rec__stacks__stack__max
                                            (us_split_discrs2
                                            temp___expr_275))) (to_rep1
                                                               (rec__stacks__stack__max
                                                               (us_split_discrs1
                                                               s))))
                                         (and
                                         (= (first1
                                            (rec__stacks__stack__data1
                                            (us_split_fields3
                                            temp___expr_275))) 1)
                                         (= (last1
                                            (rec__stacks__stack__data1
                                            (us_split_fields3
                                            temp___expr_275))) (to_rep1
                                                               (rec__stacks__stack__max
                                                               (us_split_discrs1
                                                               s))))))))

(assert
;; defqtvc
 ;; File "stacks.ads", line 26, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields))
  (=> (dynamic_invariant
  (us_repqtmk s__split_discrs s__split_fields s__attr__tag) true false true
  true)
  (=> (dynamic_invariant1 e true false true true)
  (=>
  (forall ((s__split_fields1 us_split_fields)) (is_full__function_guard
  (is_full (us_repqtmk s__split_discrs s__split_fields1 s__attr__tag))
  (us_repqtmk s__split_discrs s__split_fields1 s__attr__tag)))
  (=>
  (not
  (= (is_full (us_repqtmk s__split_discrs s__split_fields s__attr__tag)) true))
  (let ((o (us_repqtmk s__split_discrs s__split_fields s__attr__tag)))
  (let ((o1 (is_full o)))
  (=> (forall ((o2 us_rep)) (size__function_guard (size o2) o2))
  (=>
  (and (is_full__function_guard o1 o)
  (= (= o1 true)
  (= (size o) (to_rep1 (rec__stacks__stack__max s__split_discrs)))))
  (forall ((spark__branch Bool))
  (=> (= spark__branch o1)
  (=> (not (= spark__branch true))
  (forall ((o2 Int))
  (=> (= (to_rep (rec__stacks__stack__top s__split_fields)) o2) (in_range
  (+ o2 1))))))))))))))))))
(check-sat)